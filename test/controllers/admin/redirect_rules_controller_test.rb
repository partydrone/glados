require 'test_helper'

module Admin
  describe RedirectRulesController, :locale do
    let(:redirect_rule) { redirect_rules(:one) }

    describe "with authenticated user" do
      let(:user) { users(:generic_user) }

      before do
        sign_in user
      end

      describe "who is authorized" do
        before do
          user.add_role :redirect_rule_manager
        end

        it "gets index" do
          get admin_redirect_rules_path
          must_respond_with :success
        end

        it "gets new" do
          get new_admin_redirect_rule_path
          must_respond_with :success
        end

        it "creates a redirect_rule" do
          -> {
            post admin_redirect_rules_path, params: {
              redirect_rule: {
                source: '/my_short_path',
                destination: '/site/long_path'
              }
            }
          }.must_change 'RedirectRule.count'
          flash[:notice].wont_be_nil
          must_redirect_to admin_redirect_rules_path
        end

        # it "gets show" do
        #   get admin_redirect_rule_path(redirect_rule)
        #   must_respond_with :success
        # end

        it "gets edit" do
          get edit_admin_redirect_rule_path(redirect_rule)
          must_respond_with :success
        end

        it "updates a redirect_rule" do
          patch admin_redirect_rule_path(redirect_rule), params: {
            redirect_rule: {
              source: redirect_rule.source
            }
          }
          must_redirect_to admin_redirect_rules_path
        end

        it "destroys a redirect rule" do
          -> {
            delete admin_redirect_rule_path(redirect_rule)
          }.must_change 'RedirectRule.count', -1
          must_redirect_to admin_redirect_rules_path
        end
      end

      describe "who is not authorized" do
        it "prohibits index" do
          get admin_redirect_rules_path
          must_redirect_to root_path
        end

        it "prohibits new" do
          get new_admin_redirect_rule_path
          must_redirect_to root_path
        end

        it "won't create a redirect rule" do
          -> {
            post admin_redirect_rules_path, params: {
              redirect_rule: {
                source: '/my_short_path',
                destination: '/site/long_path'
              }
            }
          }.wont_change 'RedirectRule.count'
          must_redirect_to root_path
        end

        # it "prohibits show" do
        #   get admin_redirect_rule_path(redirect_rule)
        #   must_redirect_to root_path
        # end

        it "prohibits edit" do
          get edit_admin_redirect_rule_path(redirect_rule)
          must_redirect_to root_path
        end

        it "won't update a redirect rule" do
          patch admin_redirect_rule_path(redirect_rule), params: {
            redirect_rule: {
              source: redirect_rule.source
            }
          }
          must_redirect_to root_path
        end

        it "won't destroy a redirect rule" do
          -> {
            delete admin_redirect_rule_path(redirect_rule)
          }.wont_change 'RedirectRule.count', -1
          must_redirect_to root_path
        end
      end
    end

    describe "without authenticated user" do
      it "prohibits index" do
        get admin_redirect_rules_path
        must_redirect_to sign_in_path
      end

      it "prohibits new" do
        get new_admin_redirect_rule_path
        must_redirect_to sign_in_path
      end

      it "won't create a redirect rule" do
        -> {
          post admin_redirect_rules_path, params: {
            redirect_rule: {
              source: '/my_short_path',
              destination: '/site/long_path'
            }
          }
        }.wont_change 'RedirectRule.count'
        must_redirect_to sign_in_path
      end

      # it "prohibits show" do
      #   get admin_redirect_rule_path(redirect_rule)
      #   must_redirect_to sign_in_path
      # end

      it "prohibits edit" do
        get edit_admin_redirect_rule_path(redirect_rule)
        must_redirect_to sign_in_path
      end

      it "won't update a redirect rule" do
        patch admin_redirect_rule_path(redirect_rule), params: {
          redirect_rule: {
            source: redirect_rule.source
          }
        }
        must_redirect_to sign_in_path
      end

      it "won't destroy a redirect rule" do
        -> {
          delete admin_redirect_rule_path(redirect_rule)
        }.wont_change 'RedirectRule.count', -1
        must_redirect_to sign_in_path
      end
    end
  end
end
