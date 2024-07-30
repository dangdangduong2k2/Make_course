.PHONY: build clear 

PRO_DIR := .
BIN_PATH := $(PRO_DIR)/bin
OBJ_PATH := $(PRO_DIR)/obj
INC_PATH := $(PRO_DIR)/inc
SCR_PATH := $(PRO_DIR)/scr

vpath %.c $(SCR_PATH)
vpath %.h $(INC_PATH)

all_file_in_inc := $(wildcard $(INC_PATH)/*)

build: main.o tong.o 
	gcc $(OBJ_PATH)/main.o $(OBJ_PATH)/tong.o -o $(BIN_PATH)/app.exe
	echo "build done!"
	./$(BIN_PATH)/app.exe
	
%.o : %.c $(INC_PATH)
	gcc -I$(INC_PATH) -c $< -o $(OBJ_PATH)/$@ 
clear: 
	rm ./$(OBJ_PATH)/*.o
	rm ./$(BIN_PATH)/*.exe
	echo "clear done!"
log-%:
	@echo $($(subst log-,,$@)) 