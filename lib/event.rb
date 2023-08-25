require 'time'

class Event
  attr_accessor :start_date, :duration, :title, :attendees

  def initialize(start_date, duration, title, attendees)
    @start_date = Time.parse(start_date)
    @duration = duration
    @title = title
    @attendees = attendees
  end

  def end_date
    @start_date + (@duration * 60) # Convert minutes to seconds
  end

  def is_past?
    @start_date < Time.now
  end

  def is_future?
    @start_date > Time.now
  end
#time.strftime("%H:%M:%S %d/%m/%Y") time format Euopeen
  def is_soon?
    time_difference = @start_date - Time.now
    time_difference <= 30 * 60 # 30 minutes in seconds
  end

  def to_s
    puts "Titre : #{@title}"
    puts "Date de début : #{@start_date}"
    puts "Durée : #{@duration} minutes"
    puts "Invités : #{@attendees.join(', ')}"
  end

  def postpone_24h
    @start_date += 24 * 60 * 60 # 24 hours in seconds
  end
end

# Créer un nouvel événement
event = Event.new("2023-08-19 14:00", 120, "Réunion importante", ["john@example.com", "jane@example.com"])

# Afficher les informations de l'événement
event.to_s

# Vérifier si l'événement est dans moins de 30 minutes
if event.is_soon?
  puts "L'événement est bientôt !"
end

# Reporter l'événement au lendemain
puts "postpone_24h : #{event.postpone_24h}"

# Afficher les informations mises à jour
event.to_s
