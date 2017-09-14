FLAGS =	-Wall -Wextra -Werror -Ofast

COMPILATION =	gcc $(FLAGS)
MANDATORY_DIR =	./Mandatory
BONUSES_DIR = ./Bonuses

BINARIES =	$(MANDATORY_DIR)/Colleen/Colleen \
			$(MANDATORY_DIR)/Grace/Grace \
			$(MANDATORY_DIR)/Sully/Sully \
			$(BONUSES_DIR)/Colleen/Colleen \
			$(BONUSES_DIR)/Grace/Grace \
			$(BONUSES_DIR)/Sully/Sully

GENERATED_FILES =	$(MANDATORY_DIR)/Grace/Grace_kid.c \
					$(MANDATORY_DIR)/Sully/Sully_*.c \
					$(BONUSES_DIR)/Colleen/Colleen.o \
					$(BONUSES_DIR)/Grace/Grace.o \
					$(BONUSES_DIR)/Grace/Grace_kid.s \
					$(BONUSES_DIR)/Sully/Sully.o \
					$(BONUSES_DIR)/Sully/Sully_*.o \
					$(BONUSES_DIR)/Sully/Sully_*.s					

all: $(BINARIES)

$(BINARIES):
	$(COMPILATION) $(MANDATORY_DIR)/Colleen/Colleen.c -o $(MANDATORY_DIR)/Colleen/Colleen
	$(COMPILATION) $(MANDATORY_DIR)/Grace/Grace.c -o $(MANDATORY_DIR)/Grace/Grace
	$(COMPILATION) $(MANDATORY_DIR)/Sully/Sully.c -o $(MANDATORY_DIR)/Sully/Sully
	nasm -f macho64 -o $(BONUSES_DIR)/Colleen/Colleen.o $(BONUSES_DIR)/Colleen/Colleen.s
	ld -lSystem -macosx_version_min 12.10 -o $(BONUSES_DIR)/Colleen/Colleen $(BONUSES_DIR)/Colleen/Colleen.o
	nasm -f macho64 -o $(BONUSES_DIR)/Grace/Grace.o $(BONUSES_DIR)/Grace/Grace.s
	ld -lSystem -macosx_version_min 12.10 -o $(BONUSES_DIR)/Grace/Grace $(BONUSES_DIR)/Grace/Grace.o
	# nasm -f macho64 -o $(BONUSES_DIR)/Sully/Sully.o $(BONUSES_DIR)/Sully/Sully.s
	# ld -lSystem -macosx_version_min 12.10 -o $(BONUSES_DIR)/Sully/Sully $(BONUSES_DIR)/Sully/Sully.o

clean:
	rm -f $(GENERATED_FILES)

fclean: clean
	rm -f $(BINARIES)
	rm -f $(MANDATORY_DIR)/Sully/Sully_*

re: fclean all

.PHONY: all clean fclean re
