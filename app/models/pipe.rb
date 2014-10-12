class Pipe < ActiveRecord::Base
	def break
		self.update(working: false)
	end

	def fix
		self.update(working: true)
	end

	def close
		self.update(flowing: false)
	end

	def open
		self.update(flowing: true)
	end

	def to_hash
		return { working: self.working,
						 flowing: self.flowing,
						 :A => self.a,
						 :B => self.b,
						 :C => self.c }
	end

end
