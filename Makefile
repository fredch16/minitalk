# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fcharbon <fcharbon@student.42london.com>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/03/19 13:48:11 by fcharbon          #+#    #+#              #
#    Updated: 2024/03/19 20:05:58 by fcharbon         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CLIENT_NAME := client
SERVER_NAME := server
CLIENT_BONUS_NAME := client_bonus
SERVER_BONUS_NAME := server_bonus
CC := gcc
CFLAGS := -Wall -Werror -Wextra -g
CLIENT_SRCS:= client.c
SERVER_SRCS:= server.c
CLIENT_BONUS_SRCS:= client_bonus.c
SERVER_BONUS_SRCS:= server_bonus.c
INCLUDE := push_swap.h
CLIENT_OBJ := $(CLIENT_SRCS:.c=.o)
SERVER_OBJ := $(SERVER_SRCS:.c=.o)
CLIENT_BONUS_OBJ := $(CLIENT_BONUS_SRCS:.c=.o)
SERVER_BONUS_OBJ := $(SERVER_BONUS_SRCS:.c=.o)
LIBFT_D := libft
LIBFT := $(LIBFT_D)/libft.a

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

all: $(LIBFT) $(CLIENT_NAME) $(SERVER_NAME) 

bonus: $(SERVER_BONUS_NAME) $(CLIENT_BONUS_NAME)

$(CLIENT_NAME): $(CLIENT_OBJ)
	$(CC) $(CLIENT_OBJ) $(LIBFT) -o $(CLIENT_NAME)

$(SERVER_NAME): $(SERVER_OBJ)
	$(CC) $(SERVER_OBJ) $(LIBFT) -o $(SERVER_NAME)

$(CLIENT_BONUS_NAME): $(CLIENT_BONUS_OBJ)
	$(CC) $(CLIENT_BONUS_OBJ) $(LIBFT) -o $(CLIENT_BONUS_NAME)

$(SERVER_BONUS_NAME): $(SERVER_BONUS_OBJ)
	$(CC) $(SERVER_BONUS_OBJ) $(LIBFT) -o $(SERVER_BONUS_NAME)


clean:
	/bin/rm -f $(CLIENT_OBJ) $(SERVER_OBJ) $(CLIENT_BONUS_OBJ) $(SERVER_BONUS_OBJ)
fclean: clean
	/bin/rm -f $(SERVER_NAME) $(CLIENT_NAME) $(CLIENT_BONUS_NAME) $(SERVER_BONUS_NAME)
re: fclean all

.PHONY: all clean fclean re
