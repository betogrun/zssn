class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :update, :destroy]
  before_action :run_reports

  # GET /reports
  def index
    @reports = Report.all

    render json: @reports
  end

  # GET /reports/1
  def show
    render json: @report
  end

  private

    def run_reports
      report = Report.new
      report.result = Report.run
      report.save
    end
end
