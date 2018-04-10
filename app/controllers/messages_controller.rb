class MessagesController < ApplicationController
  before_action :logged_in_user, except: [:mypost]
  before_action :get_messages, except: [:mypost]
  skip_before_action :verify_authenticity_token
  def index
  end

  def create
    message = current_user.messages.build(message_params)
    if message.save
      ActionCable.server.broadcast 'room_channel',
                                    message: render_message(message)
      message.mentions.each do |mention|
          ActionCable.server.broadcast "room_channel_user_#{mention.id}", mention: true
      end
    end
  end

  def restTest
    render json: Message.restMsg
  end

  def mypost
    render json: params[:hombre].to_json
  end

  private

    def get_messages
      @messages = Message.for_display
      @message  = current_user.messages.build
    end

    def message_params
      params.require(:message).permit(:content)
    end

    def render_message(message)
      render(partial: 'message', locals: { message: message })
    end

end
