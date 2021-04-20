class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy attend_event unattend_event]

  # GET /events or /events.json
  def index
    @events = Event.order(:start).paginate(page: params[:page], per_page: 5)
  end

  # GET /events/1 or /events/1.json
  def show
    if current_user
      if !current_user.admin && @event.start > Time.now
        @event_subscibed = current_user.events.include?(@event)
      end
      
      if current_user.user_profile.gender && @event.ticket_fee
        @discounted_ticket_fee = "Rs. "+(@event.ticket_fee*0.95).to_s
      end
      @suscribers = @event.users.paginate(page: params[:page], per_page: 5)
    end
    @ticket_fee = @event.ticket_fee ? "Rs. "+(@event.ticket_fee).to_s : "Open Event" 

  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events or /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: "Event was successfully created." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: "Event was successfully updated." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: "Event was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def attend_event
    current_user.events << @event
    redirect_to :event
  end

  def unattend_event
    current_user.events.delete(@event)
    redirect_to :event
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:name, :detail, :start, :ticket_fee)
    end
end
