class InvoicesController < ApplicationController

def index
  @invoices = Invoice.all
  respond_to do |format|
   format.html {}
  end
end

def new
  @invoice = Invoice.new
  @auto_number= Invoice.next_number
  5.times do
   @invoice.line_items.build
  end
  respond_to do |format|
   format.html {}
  end
end

def create
  @invoice = Invoice.new(params[:invoice])
  @auto_number = params[:invoice][:number]
  respond_to do |format|
    if @invoice.save
      format.html { redirect_to :action=> "show",:id=>@invoice.id}
    else
      if @invoice.line_items.blank?
        5.times do
          @invoice.line_items.build
        end
      end
				  format.html {render :new}
    end	
  end
end

def edit
  @invoice = Invoice.find(params[:id])
  if @invoice.line_items.blank? 
    5.times do
      @invoice.line_items.build
    end
  end		
  respond_to do |format|
    format.html {}
  end
end

def update
  @invoice = Invoice.find(params[:id])
  respond_to do |format|
    if @invoice.update_attributes(params[:invoice])
      format.html { redirect_to :action=> "show",:id=>@invoice.id}
    else
      format.html {render :edit}
    end
  end
end

def show
  @invoice=Invoice.find(params[:id])
  respond_to do |format|
    format.html {}
  end
end

def destroy
  @invoice = Invoice.find(params[:id])
  @invoice.delete
  respond_to do |format|
    format.html { redirect_to :action=> "index"}
  end
end

end

