class CalculationsController < ApplicationController

  def word_count
    @text = params[:user_text]
    @special_word = params[:user_word]

    # ================================================================================
    # Your code goes below.
    # The text the user input is in the string @text.
    # The special word the user input is in the string @special_word.
    # ================================================================================

    @text.gsub(/[^a-z0-9\s]/i, "")
    @word_count = @text.split.count

    @character_count_with_spaces = @text.size

    @character_count_without_spaces = @text.gsub(" ","").size

    @occurrences = @text.downcase.split.count(@special_word) #?#


    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("word_count.html.erb")
  end

  def loan_payment
    @apr = params[:annual_percentage_rate].to_f
    @years = params[:number_of_years].to_i
    @principal = params[:principal_value].to_f

    # ================================================================================
    # Your code goes below.
    # The annual percentage rate the user input is in the decimal @apr.
    # The number of years the user input is in the integer @years.
    # The principal value the user input is in the decimal @principal.
    # ================================================================================
    @interest=@apr/1200
    @denominator=1-1/((1+@interest)**(@years*12))
    @payment=@principal*@interest/@denominator
    @monthly_payment = @payment

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("loan_payment.html.erb")
  end

  def time_between
    @starting = Chronic.parse(params[:starting_time])
    @ending = Chronic.parse(params[:ending_time])

    # ================================================================================
    # Your code goes below.
    # The start time is in the Time @starting.
    # The end time is in the Time @ending.
    # Note: Ruby stores Times in terms of seconds since Jan 1, 1970.
    #   So if you subtract one time from another, you will get an integer
    #   number of seconds as a result.
    # ================================================================================
    @subtraction=@ending-@starting
    @years=@subtraction/(60*60*24*7*52)
    @weeks=@subtraction/(60*60*24*7)
    @days=@subtraction/(60*60*24)
    @hours=@subtraction/(60*60)
    @minutes=@subtraction/60
    @seconds=@subtraction

    # ================================================================================
    # Your code goes above.
    # ================================================================================
    render("time_between.html.erb")
  end

  def descriptive_statistics
    @numbers = params[:list_of_numbers].gsub(',', '').split.map(&:to_f)

    # ================================================================================
    # Your code goes below.
    # The numbers the user input are in the array @numbers.
    # ================================================================================

    @sorted_numbers = @numbers.sort #correct#

    @count = @numbers.count #correct#

    @minimum = @numbers.min #correct#

    @maximum = @numbers.max #correct#

    @range = @numbers.min...@numbers.max #Still working?#

    med=@numbers.sort #correct#
    len=med.length
    @median=(med[(len-1)/2]+med[len/2])/2.0

    @sum = @numbers.sum #correct#

    @mean = @numbers.sum/@numbers.count #correct#

    var=[] #correct#
    @numbers.each do |num|
    @numsq=(num-@mean)**2/@count
      var.push(@numsq)
      @variance=var.sum
    end

    i=Math.sqrt(@variance) #correct#
    @standard_deviation = i

    @mode = @numbers.split.mod(@numbers)

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("descriptive_statistics.html.erb")
  end
end
