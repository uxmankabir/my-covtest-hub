class TestResultsController < ApplicationController
  
  def index
    redirect_to new_test_result_path
  end

  def new
    @test_result = TestResult.new
  end
  
  def create
    ttnCode = HomeTestKit.find_by(ttn_code: params[:ttn_code].to_s)
    params[:test_result][:home_test_kit_id] = ttnCode.id if ttnCode.present?
    @test_result = TestResult.new(test_result_params)
    if @test_result.save
      flash[:success] = "Your test result has been submitted successfully." 
      flash[:info] = "You can submit another test result."
      redirect_to new_test_result_path
    else
      render :new
    end
  end

  def validate_ttncode
    test_kit = HomeTestKit.find_by(ttn_code: params[:ttn_code])
    if test_kit.present?
      if TestResult.where(home_test_kit: test_kit).present?
        valid = false
        message = "Another person has already used the provided TTN Code"
      else
        valid = true
        message = "Provided TTN Code can be used"
      end
    else
      valid = false
      message = "TTN Code does not match the record in the database."
    end
    render json: { valid: valid, message: message }
  end

  def validate_email
    if TestResult.where(email: params[:email]).present?
      valid = false
      message = "The provided email is already associated with another (used) Home Test Kit"
    else
      valid = true
      message = "Provided email can be used"
    end
    render json: {valid: valid, message: message}
  end

  private

  def test_result_params
    params.require(:test_result).permit(:email, :full_name, :gender, :age, :address, :post_code, :test_result, :home_test_kit_id)
  end
  
end
