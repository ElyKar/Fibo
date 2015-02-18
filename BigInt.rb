class BigInt
	attr_accessor :rep

	def initialize(i)
		@rep = i
	end

	def +(i)
		if self.class==i.class then
			@rep = @rep+i.rep
		else
			@rep+i
		end
	end
	
	def *(i)
		@rep = @rep*i
	end
	
	def print(str)
		f = File.open(str, "w+")
		res = @rep.to_s
		f.print("#{res.length} caracteres\n")
		i=res.length-1
		while i > -1
			if i%65==0 then res.insert(i, "\n") end
			i-=1
		end
		f.print(res)
		f.close
	end

end