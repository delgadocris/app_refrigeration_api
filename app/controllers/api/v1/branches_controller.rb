class Api::V1::BranchesController < ApplicationController
  before_action :set_branches, only: %i[index]
  before_action :clear, only: %i[create]
  before_action :set_fridge, only: %i[by_fridge]
  before_action :set_branch, only: %i[index]

  def index
    @message = I18n.t('flash.actions.index.notice', resource_name: I18n.t('branch.one'))
    respond_with(@branches, @message)
  rescue StandardError => e
    render_rescue(e)
  end

  def create
    @branch = Branch.create(set_branch_params)
    @message = I18n.t('flash.actions.create.notice', resource_name: I18n.t('branch.one'))
    respond_with(@branch, @message)
  rescue StandardError => e
    render_rescue(e)
  end

  def by_fridge
    @message = I18n.t('flash.status_fridge', fridge: @branch.fridge, temperature: @branch.temperature)
    respond_with(@branch, @message)
  rescue StandardError => e
    render_rescue(e)
  end

  private

  def set_branch
    @branch = Branch.first
  end

  def set_branches
    @branches = Branch.all.order("created_at")#.paginate(page: params[:page], per_page: 5)
  end

  def set_fridge
    @branch = Branch.find_by(fridge: params[:fridge])
    unless @branch.present?
      json_response I18n.t('flash.not_found', resource_name: I18n.t('branch.fridge').downcase), false, {}, :not_found
    end
  end

  def set_branch_params
    params.require(:branch).permit(Branch.allowed_attributes)
  end

  def clear
    Branch.where(fridge: params[:branch][:fridge]).delete_all
  end
end
