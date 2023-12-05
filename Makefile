NAME = server

SRC = $(addprefix src/, printServers.cpp request.cpp main.cpp) \
      $(addprefix src/parsing/, Parse.cpp server.cpp) \
	  $(addprefix src/The_server/, Server_.cpp) \
		#zido hna 

INCLUDE_DIR = inc/ # zido hna b / f lakhr

INCLUDES = inc/*.h inc/*.hpp #will be updated to a wildcard after

# dakxi lakhor ma t9isohx

OBJ_DIR = obj

OBJ = $(patsubst $(SRC_DIR)/%,$(OBJ_DIR)/%,$(SRC:.cpp=.o))

CC = c++ 

SRC_DIR = src

CPPFLAGS = -Wall -Wextra -Werror -std=c++98  -I$(INCLUDE_DIR)

all : $(OBJ_DIR) $(NAME)

$(OBJ_DIR) :
	mkdir -p $(OBJ_DIR)
	@mkdir -p $(dir $(OBJ))

$(OBJ_DIR)/%.o : $(SRC_DIR)/%.cpp 
	$(CC) $(CPPFLAGS) -c $< -o $@

#$(OBJ_DIR)/%.o : src/The_server/%.cpp
#	$(CC) $(CPPFLAGS) -c $< -o $@

$(NAME) : $(OBJ) $(INCLUDES)
	$(CC) $(CPPFLAGS) $(OBJ) -o $(NAME)

clean : 
	rm -f $(OBJ)
	rm -rf $(OBJ_DIR)

fclean : clean
	rm -f $(NAME)

re : fclean all

.PHONY : all clean fclean re
