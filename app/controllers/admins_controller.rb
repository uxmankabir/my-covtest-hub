class AdminsController < ApplicationController
  before_action :admin_authenticated
  
  def index
    @by_gender = TestResult.group(:test_result, :gender).count
    @by_kind = TestResult.group(:test_result).count
  end

  def postcode_data
    post_code_data = Hash.new
    post_codes.each do |post_code|
      ages_data = Hash.new
      for age in 1..max_age_for_positive
        ages_data[age] = TestResult.where(test_result: :positive, post_code: post_code, age: age).count
      end
      post_code_data[post_code] = ages_data
    end
    render json: {postcode_data: post_code_data, age_limit: max_age_for_positive}
  end

  def infection_rate_postcode
    post_code_data = Hash.new
    post_codes.each do |post_code|
      data = Hash.new
      data[:negative] = TestResult.where(test_result: :negative, post_code: post_code).count
      data[:total] = TestResult.where(post_code: post_code).count
      post_code_data[post_code] = data
    end
    render json: {postcode_data: post_code_data}
  end
  
  def infection_rate_agegroup
    age_group_data = Hash.new
    for age in 1..max_age
      if TestResult.where(age: age).present?
        data = Hash.new
        data[:negative] = TestResult.where(test_result: :negative, age: age).count
        data[:total] = TestResult.where(age: age).count
        age_group_data[age] = data
      end
    end
    render json: {agegroup_data: age_group_data, age_limit: max_age}
  end
  
  private
  
  def admin_authenticated
    unless logged_in?
      flash[:danger] = "Please login first"
      redirect_to login_path
    end
  end
  
  def post_codes
    TestResult.pluck(:post_code).uniq
  end

  def max_age_for_positive
    TestResult.where(test_result: :positive).maximum(:age)
  end

  def max_age
    TestResult.maximum(:age)
  end

end
