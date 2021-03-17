class HorseDiariesController < ApplicationController
  before_action :which_horse_diary?, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  def index 
    @horse_diaries = HorseDiary.all
  end

  def show
  end

  def new
    @horse_diary = HorseDiary.new
  end

  def create
    @horse_diary = HorseDiary.new(permitted_parameter)
    @horse_diary.user = current_user
    if @horse_diary.save
      redirect_to horse_diaries_path, notice: '投稿しました'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @horse_diary.update(permitted_parameter)
      redirect_to horse_diaries_path, notice: '編集しました！！'
    else
      render :edit
    end
  end

  def destroy
    @horse_diary.destroy
    puts "@@@@@@@@@@@@@@"
    redirect_to horse_diaries_path, notice: '削除しました'
  end
  private
  def which_horse_diary?
    @horse_diary = HorseDiary.find(params[:id])
  end
  def permitted_parameter
    params.require(:horse_diary).permit(:content, :user_id)
  end
end
