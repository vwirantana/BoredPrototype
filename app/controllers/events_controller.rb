class EventsController < ApplicationController
  # GET /events
  # GET /events.xml
  def index
    @events = Event.all
	@my_events = Event.where(:user_id => 'byee')
	@event = Event.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @events }
    end
  end

  # GET /events/1
  # GET /events/1.xml
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/new
  # GET /events/new.xml
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
	
	respond_to do |format|
		format.html
		format.js do
			
		end
	end
  end
  
  # POST /events
  # POST /events.xml
  def create
    @event = Event.new(params[:event])
	#puts params[:event]
    respond_to do |format|
      if @event.save
        format.html { redirect_to(@event, :notice => 'Event was successfully created.') }
		format.js do
			responds_to_parent {render}
		end
      else
	  puts @event.errors
        format.html { render :action => "new" }
		format.js do 
			#do something?
		end
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.xml
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to(@event, :notice => 'Event was successfully updated.') }
        format.js do
			responds_to_parent {render}
		end
      else
        format.html { render :action => "edit" }
        format.js do
			#something
		end
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.xml
  def destroy
    @event = Event.find(params[:id])
	
    respond_to do |format|
	  if @event.destroy
		@my_events = Event.where(:user_id => 'byee')
      format.html { redirect_to(events_url) }
      format.js do
		#responds_to_parent{render}
	  end
	  end
    end
  end
end
