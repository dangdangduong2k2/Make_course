.PHONY: build clear 

PRO_DIR := .
BIN_PATH := $(PRO_DIR)/bin
OBJ_PATH := $(PRO_DIR)/obj
INC_PATH := $(PRO_DIR)/inc
SCR_PATH := $(PRO_DIR)/scr



SCR_FILES := $(foreach SCR_PATH, $(SCR_PATH), $(wildcard $(SCR_PATH)/*.c) ) 
INC_FILES := $(foreach INC_PATH, $(INC_PATH), $(wildcard $(INC_PATH)/*.h) ) 
ANOTHER_FILES := $(foreach PRO_DIR, $(PRO_DIR), $(wildcard $(PRO_DIR)/*.c) ) 
OBJ_FILES := $(notdir $(SCR_FILES)) 
OBJ_FILES += $(notdir $(ANOTHER_FILES)) 
OBJ_FILES := $(subst .c,.o, $(OBJ_FILES))
ALL_OBJ_PATH := $(foreach OBJ_FILES, $(OBJ_FILES), $(OBJ_PATH)/$(OBJ_FILES))
vpath %.c $(SCR_PATH)
vpath %.h $(INC_PATH)
build: $(OBJ_FILES)
	gcc $(ALL_OBJ_PATH) -o $(BIN_PATH)/app.exe
	echo "build done!"
	./$(BIN_PATH)/app.exe
	
%.o: %.c $(INC_FILES)
	gcc -I$(INC_PATH) -c $< -o $(OBJ_PATH)/$@ 

clear: 
	rm ./$(OBJ_PATH)/*.o
	rm ./$(BIN_PATH)/*.exe
	echo "clear done!"

log-%:
	@echo $($(subst log-,,$@)) 