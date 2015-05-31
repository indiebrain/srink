require "rails_helper"

describe LinksController do

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

      post(:create,
           link: link_attributes)

      expect(assigns(:link)).
        to_not be_nil
    end

    it "redirects to the created link when the new link is created" do
      user = sign_in
      link_attributes = attributes_for(:link)

      post(:create,
           link: link_attributes)

      link = user.links.first
      expect(response).
        to redirect_to(link_path(link))
    end

    it "renders the new link form when the new link is not created" do
      sign_in
      invalid_link_attributes = {url: nil}

      post(:create,
           link: invalid_link_attributes)

      expect(response).
        to render_template(:new)
    end

    it "assigns link when the new link is not created" do
      sign_in
      invalid_link_attributes = {url: nil}

      post(:create,
           link: invalid_link_attributes)

      expect(assigns(:link)).
        to_not be_nil
    end

    it "returns an HTTP unprocessable entity status code when the new link is not created" do
      sign_in
      invalid_link_attributes = {url: nil}

      post(:create,
           link: invalid_link_attributes)

      expect(response).
        to have_http_status(:unprocessable_entity)
    end

    it "renders a failure flash message when the new link is not created" do
      sign_in
      invalid_link_attributes = {url: nil}

      post(:create,
           link: invalid_link_attributes)

      expect(flash[:error]).
        to_not be_nil
    end
  end
end
