class HomeController < ApplicationController
    def index
        @allpost = Posting.all
        
    end
    
    
    def write
        atwit = Posting.new
        atwit.dname = params[:username]
        atwit.dpass = params[:userpass]
        atwit.dcont = params[:usercontent]
        atwit.save
        
        redirect_to(:back)
    end
    
    def delete
        @error_print = flash[:errors_m]
        @target = Posting.find(params[:id])
    end
    
    
    
    def destroy
        del_target = Posting.find(params[:id])
        
        if del_target.dpass == params[:pass_forDEL]
            del_target.destroy
            redirect_to '/'
        else
            redirect_to :back, :flash => { :errors_m => "pass doesn't match" }
        end
    end
    
    
    def edit
        @error_print = flash[:errors_m]
        @edit_target = Posting.find(params[:id])
    end
    def editpush
        edit_target = Posting.find(params[:id])
        if edit_target.dpass == params[:pass_forEDIT]
            edit_target.dcont = params[:cont_toEDIT]
            edit_target.save
            redirect_to '/'
        else
            redirect_to :back, :flash => { :errors_m => "pass doesn't match" }
        end
    end
    
    def reply
        
        comment = Twitreply.new
        comment.posting_id = params[:target_post]
        comment.repline = params[:userreply]
        comment.save
        redirect_to '/'
        #redirect_to(:back)
    end
    
end
