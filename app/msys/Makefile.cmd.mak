#================================================    
# shell
all: run
   
run:
	@cd $(GPROJECT_SRC) && ./main.sh $(argv)
#================================================    
# git
git_push:
	@cd $(GPROJECT_PATH) && git pull && git add --all && git commit -m "Initial Commit" && git push -u origin master
git_push_o:
	@cd $(GPROJECT_PATH) && git add --all && git commit -m "Initial Commit" && git push -u origin master
git_push_u:
	@cd $(GPROJECT_PATH) && git push -u origin master
git_store:
	@cd $(GPROJECT_PATH) && git config credential.helper store
git_clone:
	@cd $(GPROJECT_ROOT) && git clone $(GGIT_URL) $(GGIT_NAME) 
#================================================    
