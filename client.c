/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: fcharbon <fcharbon@student.42london.com>   +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/03/19 12:57:05 by fcharbon          #+#    #+#             */
/*   Updated: 2024/03/19 14:27:04 by fcharbon         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

void	char_to_bin(char *str)
{
	size_t			i;
	int				j;
	unsigned char	c;

	i = 0;
	while (i < ft_strlen(str))
	{
		c = (unsigned char)str[i];
		ft_printf("%c: ", c);
		j = 7;
		while (j >= 0)
		{
			if (((c & 1 << j)) == 0)
				ft_putchar_fd('0', 1);
			else 
				ft_putchar_fd('1', 1);
			j--;
		}
		ft_printf("\n");
		i++;
	}
}

int	main(void)
{
	char_to_bin("lol bozo");
	return (0);
}
