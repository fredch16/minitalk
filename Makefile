# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fcharbon <fcharbon@student.42london.com>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/03/19 13:48:11 by fcharbon          #+#    #+#              #
#    Updated: 2024/03/19 14:19:29 by fcharbon         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME := minitalk
CC := gcc
CFLAGS := -Wall -Werror -Wextra -g
SRCS:= client.c

INCLUDE := push_swap.h
OBJ := $(SRCS:.c=.o)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

$(NAME): $(OBJ)
	$(CC) $(OBJ) -lft -Llibft -o $(NAME)

all: $(NAME)

clean:
	/bin/rm -f $(OBJ)
fclean: clean
	/bin/rm -f $(NAME)
re: fclean all

.PHONY: all clean fclean re
