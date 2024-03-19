/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client_bonus.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: fcharbon <fcharbon@student.42london.com>   +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/03/19 18:55:12 by fcharbon          #+#    #+#             */
/*   Updated: 2024/03/19 19:29:00 by fcharbon         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

void	char_to_sig(int pid, char c)
{
	int			i;

	i = 7;
	while (i >= 0)
	{
		if (((c & 1 << i)) == 0)
			kill(pid, SIGUSR2);
		else
			kill(pid, SIGUSR1);
		i--;
		usleep(420);
	}
}

void	handle_receipt(int signal)
{
	if (signal == SIGUSR1)
		ft_printf("Server has acknowledged the message\n");
}

int	main(int argc, char *argv[])
{
	pid_t		server_pid;
	const char	*message;
	int			i;

	signal(SIGUSR1, handle_receipt);
	if (argc != 3)
	{
		ft_printf("Argument Error\n");
		ft_printf("Usage: %s <pid> <message> \n", argv[0]);
		exit(EXIT_FAILURE);
	}
	server_pid = ft_atoi(argv[1]);
	message = argv[2];
	i = 0;
	while (message[i])
		char_to_sig(server_pid, message[i++]);
	char_to_sig(server_pid, '\0');
	return (0);
}
