class PlansController < ApplicationController
    def index
        @plans = Plan.all
    end

    def new
        @plan = Plan.new()
    end

    def create
        @plan = Plan.new(params.require(:plan).permit(:title, :start, :end, :allday, :memo))
        if @plan.save
            #flash[:notice] = "予定を登録しました"
            redirect_to :plans
        else
            flash[:notice] = "登録に失敗しました"
            render "new"
        end
    end

    def show
    end
    
    def edit
    end

    def update
    end

    def destroy
        @plan = Plan.find(params[:id])
        @plan.destroy
        redirect_to :plans
    end
end
