class LinksController < ApplicationController
before_action 
	def index
		
	end

	def new
		@link = Link.new
	end

	def create
		@link = Link.new(safe_params)

		@link.hash_code = random_hash

		if @link.save
			redirect_to @link
		end
	end

	def show
		@link = Link.find(params[:id])
		@full_path = "#{request.protocol}#{request.host_with_port}/#{@link.hash_code}"

		
	end

	def redirectors
		@link = Link.find_by hash_code: params[:hash_code]
		if @link
			redirect_to @link.link
		else
			redirect_to root_path
		end
	end

	def preview
		@link = link.find_by hash_code: params[:hash_code]
		unless @link
			redirect_to root_path
		end
	end

	private 

	def safe_params
		params.require(:link).permit(:link)
		
	end

	def random_hash
		SecureRandom.urlsafe_base64(8)
	end
end