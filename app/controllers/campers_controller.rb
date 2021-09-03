class CampersController < ApplicationController

    def index
        render json: Camper.all, include: [:id, :name, :age]
    end

    def show
        camper = Camper.find_by(id: params[:id])
        if camper
            render json: camper
        else
            render json: {"error": "Camper not found"}
        end
    end

    def create
        camper = Camper.create(camper_params)
        if camper
            render json: camper, status: :created, include: [:id, :name, :age]
        else
            render json: camper, status: :unprocessaable_entity
        end
    end

    private

    def camper_params
        params.permit(:name, :age)
    end
end
