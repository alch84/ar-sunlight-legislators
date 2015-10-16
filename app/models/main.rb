require_relative 'legislator.rb'

def code(state)

	puts "Senators:"
	result = Legislator.where('state = ?',state).where('in_office = ?',true).where('title = ?','Sen').order('lastname')
		result.each do |x|
			puts "#{x.name} (#{x.party})"
			# p "#{result} #{Legislator}"
		end
	puts "Representatives:"
	result2 = Legislator.where('state = ?',state).where('in_office = ?',true).where('title = ?','Rep').order('lastname')
		result2.each do |x|
			puts "#{x.name} (#{x.party})"
			# p "#{result} #{Legislator}"
		end
end


def split(gender)

	puts "#{gender =="M"? "Male":"Female"} Senators: #{Legislator.where('gender=?',gender).where('title=?','Sen').where('in_office =?',true).count} (#{(Legislator.where('gender=?',gender).where('title=?','Sen').where('in_office =?',true).count*100)/(Legislator.where('title=?','Sen').where('in_office =?',true).count)}%)"
	puts "#{gender =="M"? "Male":"Female"} Representatives: #{Legislator.where('gender=?',gender).where('title=?','Rep').where('in_office =?',true).count} (#{(Legislator.where('gender=?',gender).where('title=?','Rep').where('in_office =?',true).count*100)/(Legislator.where('title=?','Rep').where('in_office =?',true).count)}%)"

end


def states

array = Legislator.uniq.pluck(:state)
# order(Legislator.all.count)
	arr = []

array.each_with_index do |x,i|
		arr << [x,Legislator.where('title = ?','Sen').where('state = ?',x.to_s).where('in_office = ?',true).count, Legislator.where('title = ?','Rep').where('state = ?',x.to_s).where('in_office = ?',true).count]

		# puts "#{x}: #{Legislator.where('title = ?','Sen').where('state = ?',x.to_s).where('in_office = ?',true).count} Senators, #{Legislator.where('title = ?','Rep').where('state = ?',x.to_s).where('in_office = ?',true).count} Representatives"

	end

arr.sort_by!{|k|-(k[1]+k[2])}

	arr.each do |x|
		puts "#{x[0]}: #{x[1]} Senators, #{x[2]} Representatives"
	end

end


def summary

	puts "Senators: #{Legislator.where('title=?','Sen').count}"

	puts "Representatives: #{Legislator.where('title=?','Rep').count}"
	puts "#{Legislator.count}"
end

def delete
	Legislator.destroy_all(:in_office => false)

end

states
summary
delete
summary

