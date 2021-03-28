require "rails_helper"

describe LinksController do

  describe "DELETE #destroy" do
    it "requires authentication" do
      link = create(:link)
      delete(
        :destroy,
        params: {
          id: link.id
        }
      )

      expect(response).
        to redirect_to(sign_in_path)
    end

    it "redirects to the links index when the link is deleted" do
      user = sign_in
      link = create(
        :link,
        user: user
      )

      delete(
        :destroy,
        params: {
          id: link.id
        }
      )

      expect(response).
        to redirect_to(links_path)
    end

    it "renders a notice flash when the link is deleted" do
      user = sign_in
      link = create(
        :link,
        user: user
      )

      delete(
        :destroy,
        params: {
          id: link.id
        }
      )

      expect(flash[:notice]).
        to eq(t("links.delete.deleted_link", url: link.url))
    end
  end

  describe "GET #index" do
    it "require authentication" do
      get(:index)

      expect(response).
        to redirect_to(sign_in_path)
    end

    it "assigns the user's links" do
      user = sign_in
      user_link = create(
        :link,
        user: user
      )
      _other_user_link = create(:link, url: "https://some-other-url.example")

      get(:index)

      expect(assigns(:links)).
        to match_array([user_link])
    end
  end

  describe "GET #new" do
    it "requires authentication" do
      get(:new)

      expect(response).
        to redirect_to(sign_in_path)
    end

    it "assigns link" do
      sign_in

      get(:new)

      expect(assigns(:link)).
        to have_equivalent_attributes(Link.new)
    end
  end

  describe "POST #create" do
    it "requires authentication" do
      post(:create)

      expect(response).
        to redirect_to(sign_in_path)
    end

    it "assigns link when the new link is created" do
      sign_in
      link_attributes = attributes_for(:link)

      post(
        :create,
        params: {
          link: link_attributes
        }
      )

      expect(assigns(:link)).
        to_not be_nil
    end

    it "redirects to the user list of links when the new link is created" do
      user = sign_in
      link_attributes = attributes_for(:link)

      post(
        :create,
        params: {
          link: link_attributes
        }
      )

      link = user.links.first
      expect(response).
        to redirect_to(links_path)
    end

    it "renders the new link form when the new link is not created" do
      sign_in
      invalid_link_attributes = {url: nil}

      post(
        :create,
        params: {
          link: invalid_link_attributes
        }
      )

      expect(response).
        to render_template(:new)
    end

    it "assigns link when the new link is not created" do
      sign_in
      invalid_link_attributes = {url: nil}

      post(
        :create,
        params: {
          link: invalid_link_attributes
        }
      )

      expect(assigns(:link)).
        to_not be_nil
    end

    it "returns an HTTP unprocessable entity status code when the new link is not created" do
      sign_in
      invalid_link_attributes = {url: nil}

      post(
        :create,
        params: {
          link: invalid_link_attributes
        }
      )

      expect(response).
        to have_http_status(:unprocessable_entity)
    end

    it "renders a failure flash message when the new link is not created" do
      sign_in
      invalid_link_attributes = {url: nil}

      post(
        :create,
        params: {
          link: invalid_link_attributes
        }
      )

      expect(flash[:error]).
        to_not be_nil
    end
  end
end
