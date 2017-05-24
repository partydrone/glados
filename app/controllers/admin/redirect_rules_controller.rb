module Admin
  class RedirectRulesController < BaseController
    before_action :set_redirect_rule, only: [:edit, :update, :destroy]

    def index
      @redirect_rules = RedirectRule.order(:source)
      authorize @redirect_rules
    end

    def new
      @redirect_rule = RedirectRule.new
      authorize @redirect_rule
    end

    def edit
    end

    def create
      @redirect_rule = RedirectRule.new(redirect_rule_params)
      authorize @redirect_rule

      if @redirect_rule.save
        redirect_to admin_redirect_rules_path, notice: %(Saved "#{@redirect_rule.source}" successfully.)
      else
        render :new
      end
    end

    def update
      if @redirect_rule.update(redirect_rule_params)
        respond_to do |format|
          format.html { redirect_to admin_redirect_rules_path, notice: %(Updated "#{@redirect_rule.source}" successfully.) }
          format.js
        end
      else
        respond_to do |format|
          format.html { render :edit }
          format.js
        end
      end
    end

    def destroy
      @redirect_rule.destroy
      redirect_to admin_redirect_rules_path, notice: %(Deleted "#{@redirect_rule.source}" successfully.)
    end

    private

    def set_redirect_rule
      @redirect_rule = RedirectRule.find(params[:id])
      authorize @redirect_rule
    end

    def redirect_rule_params
      params.require(:redirect_rule).permit(:source, :source_is_regex, :source_is_case_sensitive, :destination, :active)
    end
  end
end
