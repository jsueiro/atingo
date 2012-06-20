require 'spec_helper'

describe "Static pages" do

  subject { page } # es el sujeto en comun (la pagina)

  # este es un test en comun para todas las paginas, en cuanto al tag h1 y el title
  shared_examples_for "all static pages" do
    it { should have_selector('h1',    text: heading) }
    it { should have_selector('title', text: full_title(page_title)) }
  end

  describe "Home page" do
    
    before { visit root_path } #esto reemplaza a visit root_path
    let(:heading)    { 'Sample App' }
    let(:page_title) { '' }
    it_should_behave_like "all static pages"

    it { should_not have_selector 'title', text: '| Home' }
  
  end

  describe "Help page" do

    before { visit help_path }

    let(:heading)    { 'Help' }
    let(:page_title) { 'Help' }
    it_should_behave_like "all static pages"

  end

  describe "About page" do

    before { visit about_path }

    let(:heading)    { 'About Us' }
    let(:page_title) { 'About Us' }
    it_should_behave_like "all static pages"

  end

  describe "Contact page" do

    before { visit contact_path }

    let(:heading)    { 'Contact Us' }
    let(:page_title) { 'Contact Us' }
    it_should_behave_like "all static pages"

  end

  # este es un test que sigue los links
  it "should have the right links on the layout" do
    visit root_path
    
    click_link "About"
    page.should have_selector 'title', text: full_title('About Us')
    
    click_link "Help"
    page.should have_selector 'title', text: full_title('Help')
    
    click_link "Contact"
    page.should have_selector 'title', text: full_title('Contact Us')
    
    click_link "Home"
    
    click_link "Sign up now!"
    page.should have_selector 'title', text: full_title('Sign up')
    
    click_link "sample app"
    page.should have_selector 'title', text: full_title('')
  end


end