class GoalsController < ApplicationController
  before_action :logged_in_user
  def new
    @goal = Goal.new
  end

  def create
    # ログインされている必要がある
    year = params[:goal]["date(1i)"]
    month = params[:goal]["date(2i)"]
    day = params[:goal]["date(3i)"]
    date = Time.zone.parse("#{year}-#{month}-#{day}")

    book = Book.find_by(isbn: params[:goal][:isbn])
    # 本がないとき
    if book.nil?
      redirect_to new_book_path and return
    end

    @goal = Goal.new(user_id: current_user.id, book_id: book.id, date: date)
    if @goal.save
      redirect_to current_user
    else
      render 'goal/new'
    end
  end
end
