class BinNumber
	attr_accessor :rep
	@@puiss2 = [1,2,4,8,16,32,64,128,256,512,1024,2048,4096,8192,16384,32768,65536,131072,262144,524288,1048576,2097152,4194304,8388608,16777216,33554432,67108864,134217728,268435456,536870912]
	
	def initialize
		@rep = [1]
	end
	
	def +(x)
		i = 0
		carry = 0
		while(i < @rep.length || i < x.rep.length)
			if (i < @rep.length && i < x.rep.length) then
				carry = self.add(@rep[i], x.rep[i], i, carry)
			elsif (i < @rep.length) then
				carry = self.add(@rep[i], 0, i, carry)
			else 
				@rep.push(0)
				carry = self.add(0, x.rep[i], i, carry)
			end
			i+=1
		end
		if (carry == 1) then @rep.push(1) end
	end
	
	def add(rep, xrep, i, c)
		cur = rep+xrep+c
		@rep[i] = cur%1073741824
		if (cur > 1073741824) then return 1
		else return 0 end
	end
	
	def writeBin(n)
		f = File.open("E:\\Tristan\\Ruby\\Fibo\\FiBin2M.txt", "w+")
		f.print("#{n} ieme terme : #{self.rep.length} bits")
		i = 0
		self.to_bin
		@rep.reverse.each {|b|
			if (i%50 == 0) then f.print("\n") end
			f.print(b)
			i+=1
		}
	end
	
	def to_bin
		res = []
		@rep.each{|b|
			i = 0
			while (i < 30)
				if (b > @@puiss2[29-i]) then
					res.push(1)
					res -=@@puiss2[29-i]
				else
					res.push(0)
				end
			end
		}
		@rep = res
	end
	
	def writeInt(n)
		f = File.open("E:\\Tristan\\Ruby\\Fibo\\FiInt.txt", "w+")
		f.print("#{n} ieme terme : #{self.rep.length} bits")
		i = 0
		@rep.reverse.each{|b|
			if (i%5 == 0) then f.print("\n") end
			f.print("#{b}")
			i+=1
		}
	end
	
end

require_relative("BigInt.rb")

b1 = BigInt.new(1)
b2 = BigInt.new(1)

N = ARGV[0].to_i
i = 1
while (i < N)
	b1+b2
	b2+b1
	i+=2
	if (i%1000==1) then puts i-1 end
end

if (b1.rep < b2.rep) then
	b2.print("/mnt/sdb3/Ruby/Fibo/fibo.txt")
else
	b1.print("/mnt/sdb3/Ruby/Fibo/fibo.txt")
end

#puts "#{b1.rep}"
#puts "#{b2.rep}"
