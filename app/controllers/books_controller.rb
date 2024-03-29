# -*- coding: utf-8 -*-
class BooksController < ApplicationController
  # GET /books
  # GET /books.json
  def index
    # @books = Book.all

    @books = Book.order('published DESC').
      paginate(:page => params[:page], :per_page => 3)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @books }
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @book = Book.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @book }
    end
  end

  # GET /books/new
  # GET /books/new.json
  def new
    @book = Book.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @book }
    end
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(params[:book])

    respond_to do |format|
      if @book.save
        logger.info("save success.")
        logger.info(@book.inspect)
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render json: @book, status: :created, location: @book }
      else
        format.any {render :text => '失敗'}
        #format.html { render action: "new" }
        #format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /books/1
  # PUT /books/1.json
  def update
    @book = Book.find(params[:id])

    respond_to do |format|
      if @book.update_attributes(params[:book])
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url }
      format.json { head :ok }
    end
  end

  def search
    @keydate_from = params[:keydate_from]['(1i)'] + '-' + params[:keydate_from]['(2i)'] + '-' + params[:keydate_from]['(3i)']
    @keydate_to = params[:keydate_to]['(1i)'] + '-' + params[:keydate_to]['(2i)'] + '-' + params[:keydate_to]['(3i)']
    @books = Book.where('published >= ? AND published <= ?', @keydate_from, @keydate_to)
  end
end
