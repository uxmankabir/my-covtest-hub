class TestResultsController < ApplicationController
  
  def index
    redirect_to new_test_result_path
  end

  def new
    @test_result = TestResult.new
  end
  
  def create
    ttnCode = HomeTestKit.find_by(ttn_code: params[:ttn_code].to_s)
    params[:test_result][:home_test_kit_id] = ttnCode.id 
    @test_result = TestResult.new(test_result_params)
    if @test_result.save
      flash[:success] = "Your test result has been submitted successfully." 
      flash[:info] = "You can submit another test result."
      redirect_to new_test_result_path
    else
      render :new
    end
  end

  def ttn_code
    test_kit = HomeTestKit.find_by(ttn_code: params[:ttn_code])
    valid = test_kit.present? ? TestResult.where(home_test_kit: test_kit).where.not(email: params[:email]).present? ? false : true : false
    render json: { valid: valid }
  end

  private

  def test_result_params
    params.require(:test_result).permit(:email, :full_name, :gender, :age, :address, :post_code, :test_result, :home_test_kit_id)
  end
  
end
