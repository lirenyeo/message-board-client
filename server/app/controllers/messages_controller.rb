# frozen_string_literal: true

class MessagesController < ApplicationController
  def index
    messages = Message.all.order('created_at DESC').limit(50)
    render json: messages
  end

  def create
    message = Message.new(text: params[:text])
    if message.save
      render json: { message: message, status: 'Successfully added message' }, status: 200
    else
      render json: message.errors, status: 400
    end
  end

  def destroy
    message = Message.find_by(id: params[:id])

    if message.nil?
      render json: { status: 'Invalid message ID was given' }, status: 400
    elsif message.destroy
      render json: { status: 'Successfully deleted message' }, status: 200
    else
      render json: message.errors, status: 400
    end
  end
end
