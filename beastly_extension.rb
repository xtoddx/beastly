# Uncomment this if you reference any of your controllers in activate
require_dependency 'application'

class BeastlyExtension < Radiant::Extension
  version "0.1"
  description "Allow your Radiant to play with Altered Beast forum software."
  url "http://rubidine.com/open-source/beastly"
  
  # define_routes do |map|
  #   map.connect 'admin/beastly/:action', :controller => 'admin/beastly'
  # end
  
  def activate
    controllers = [
      Admin::AbstractModelController,
      Admin::ExportController,
      Admin::ExtensionController,
      Admin::LayoutController,
      Admin::PageController,
      Admin::SnippetController,
      Admin::UserController
    ]

    controllers.each do |c|
      methods = c.action_methods.to_a
      methods << {
        :when => :admin,
        :denied_url => {:action=>'login', :controller=>'admin/welcome'},
        :denied_message => 'You must have administrative privileges to perform this action'
      }
      c.send :only_allow_access_to, *methods
    end

    Admin::WelcomeController.class_eval do
      def index
        if current_user.admin?
          redirect_to page_index_url
          return
        end
      end
    end

  end
  
  def deactivate
  end
  
end
