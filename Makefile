install:
	ansible-galaxy role install -r requirements.yml
	ansible-galaxy collection install -r requirements.yml
	make touch-vault-password-file

provision-and-deploy:
	ansible-playbook -i inventory.ini -v --vault-password-file vault-password playbook.yml

deploy:
	ansible-playbook -i inventory.ini -v --vault-password-file vault-password --tags deploy playbook.yml

touch-vault-password-file:
	touch vault-password

encrypt-vault:
	ansible-vault encrypt $(FILE) --vault-password-file vault-password

decrypt-vault:
	ansible-vault decrypt $(FILE) --vault-password-file vault-password

view-vault:
	ansible-vault view $(FILE) --vault-password-file vault-password

edit-vault:
	ansible-vault edit $(FILE) --vault-password-file vault-password

create-vault:
	ansible-vault create $(FILE) --vault-password-file vault-password
