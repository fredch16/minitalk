# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fcharbon <fcharbon@student.42london.com>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/03/19 13:48:11 by fcharbon          #+#    #+#              #
#    Updated: 2024/03/19 16:36:53 by fcharbon         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CLIENT_NAME := client
SERVER_NAME := server
CC := gcc
CFLAGS := -Wall -Werror -Wextra -g
CLIENT_SRCS:= client.c
SERVER_SRCS:= server.c
INCLUDE := push_swap.h
CLIENT_OBJ := $(CLIENT_SRCS:.c=.o)
SERVER_OBJ := $(SERVER_SRCS:.c=.o)
LIBFT_D := libft
LIBFT := $(LIBFT_D)/libft.a

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

$(CLIENT_NAME): $(CLIENT_OBJ)
	$(CC) $(CLIENT_OBJ) $(LIBFT) -o $(CLIENT_NAME)

$(SERVER_NAME): $(SERVER_OBJ)
	$(CC) $(SERVER_OBJ) $(LIBFT) -o $(SERVER_NAME)

all: $(LIBFT) $(CLIENT_NAME) $(SERVER_NAME)

clean:
	/bin/rm -f $(CLIENT_OBJ) $(SERVER_OBJ)
fclean: clean
	/bin/rm -f $(CLIENT_NAME) $(SERVER_NAME)
re: fclean all

.PHONY: all clean fclean re
