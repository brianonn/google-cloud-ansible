.PHONY: create delete all

all: 
	@ echo "run 'make create' to create a GCP VM instance and install nginx"
	@ echo "run 'make destroy' to destroy everything created by 'make create'"
	@ echo ""
	@ echo "You can set env variable VM_HOST=foo to override the one it will create" 
	@ echo "i.e.  'VM_HOST=host-app-1 make create" 

ifneq ($(VM_NAME),)
  OVERRIDES := -e vm_name="$(VM_NAME)"
endif
  
create:
	ansible-playbook $(OVERRIDES) -i inventory/hosts create.yaml

destroy:
	ansible-playbook $(OVERRIDES) -i inventory/hosts destroy.yaml

