# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vandre <vandre@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/10/21 13:10:51 by vandre            #+#    #+#              #
#    Updated: 2023/11/23 16:41:31 by vandre           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRC_DIR 			:=		src
OBJ_DIR 			:=		obj
LIBFT_DIR 			=		libft
MLX_DIR				= 		minilibx-linux

NAME 				= 		so_long

SRC					=		$(wildcard $(SRC_DIR)/*.c)
OBJ 				=		$(SRC:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)
LIBFT				=		libft/libft.a
MLX					=		minilibx-linux/libmlx.a

CC					=		cc
CPPFLAGS			=		-I./include -I./libft/include -I./minilibx-linux
MLXFLAGS			=		-Lmlx -lXext -lX11
CFLAGS				=		-Wall -Wextra -Werror -g

$(NAME):			$(OBJ) $(LIBFT) $(MLX)
						$(CC) $(CFLAGS) $(CPPFLAGS) -lm $(OBJ) $(MLXFLAGS) $(LIBFT) -o $(NAME) $(MLX)

$(OBJ_DIR):
					mkdir -p $@

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
							@mkdir -p $(@D)
							$(CC) $(CPPFLAGS) $(CFLAGS) $(INCLUDE) -c $< -o $@

all: 						$(NAME)

clean:
	rm -r $(OBJ_DIR)

fclean: 			clean
			rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re
