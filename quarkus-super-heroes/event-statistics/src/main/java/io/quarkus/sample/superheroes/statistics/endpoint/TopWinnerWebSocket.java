package io.quarkus.sample.superheroes.statistics.endpoint;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.websocket.server.ServerEndpoint;

import io.quarkus.scheduler.Scheduled;

import io.quarkus.sample.superheroes.statistics.domain.Score;

import io.smallrye.mutiny.Multi;

/**
 * WebSocket endpoint for the {@code /stats/winners} endpoint. Exposes the {@code winner-stats} channel over the socket to anyone listening.
 * <p>
 *   Uses constructor injection over field injection to show how it is done.
 * </p>
 * @see TopWinnerStatsChannelHolder
 */
@ServerEndpoint("/stats/winners")
@ApplicationScoped
public class TopWinnerWebSocket extends EventStatsWebSocket<Iterable<Score>> {
	private final TopWinnerStatsChannelHolder topWinnerStatsChannelHolder;

	public TopWinnerWebSocket(TopWinnerStatsChannelHolder topWinnerStatsChannelHolder) {
		this.topWinnerStatsChannelHolder = topWinnerStatsChannelHolder;
	}

  @Override
  protected Multi<Iterable<Score>> getStream() {
    return this.topWinnerStatsChannelHolder.getWinners();
  }

  @Scheduled(every = "${pingInterval.topWinners:1m}", delayed = "${pingInterval.topWinners:1m}")
  @Override
  void sendPings() {
    // This is overridden here because of https://github.com/quarkusio/quarkus/issues/38781
    super.sendPings();
  }
}
