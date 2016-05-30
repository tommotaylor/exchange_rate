class ConversionsController < ApplicationController
  def new
    conversion = Conversion.new(params[:conversion] || {})
    render :new, locals: { conversion: conversion }
  end

  def create
    result = converter.convert(usd_amount: usd_amount, date: date)
    if result
      redirect_to conversion_path(result)
    else
      render :new
    end
  end

  def show
    render :show, locals: { conversion: conversion, rate: conversion.rate }
  end

  private

  def converter
    ExchangeRateConverter.new
  end

  def conversion
    @conversion ||= Conversion.find(params[:id])
  end

  def date
    @date ||= conversion_params[:date].to_date
  end

  def usd_amount
    @amount ||= conversion_params[:usd_amount].to_i
  end

  def conversion_params
    params.require(:conversion).permit(:usd_amount, :date)
  end
end
