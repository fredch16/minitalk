/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_printnbr_base_u.c                               :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: fcharbon <fcharbon@student.42london.com>   +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/12/05 18:48:27 by fcharbon          #+#    #+#             */
/*   Updated: 2024/03/19 18:20:36 by fcharbon         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"
#include <stdio.h>

int	ft_printnbr_base_u(unsigned long n, unsigned int base, char *symbols)
{
	int		count;

	if (n < base)
		return (ft_printchar(symbols[n]));
	else
	{
		count = ft_printnbr_base(n / base, base, symbols);
		return (count + ft_printnbr_base(n % base, base, symbols));
	}
}
