class CardsController < ApplicationController
  def sort
    @card = Card.find(params[:id])
    @card.update(row_order_position: params[:row_order_position], list_id: params[:list_id])
    head :no_content
  end
end
