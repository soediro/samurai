package com.sirolf2009.samurai.tasks

import com.sirolf2009.samurai.Samurai
import com.sirolf2009.samurai.strategy.IStrategy
import eu.verdelhan.ta4j.TimeSeries
import eu.verdelhan.ta4j.TradingRecord
import javafx.concurrent.Task
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors class BackTest extends Task<TradingRecord> {

	val Samurai samurai
	val IStrategy strategy
	val TimeSeries series

	new(Samurai samurai, IStrategy strategy, TimeSeries series) {
		this.samurai = samurai
		this.strategy = strategy
		this.series = series
	}

	override protected call() throws Exception {
		updateMessage("Running backtest")
		val tradingRecord = series.run(strategy.setup(series))
		updateMessage("Done")
//
//		updateMessage("Parsing results")
//		val cashFlow = new CashFlow(series, tradingRecord)
//		println("Net Profit: " + cashFlow.getValue(cashFlow.size - 1))
//
//		val profitTradesRatio = new AverageProfitableTradesCriterion()
//		System.out.println("Profitable trades ratio: " + profitTradesRatio.calculate(series, tradingRecord))
//
//		val rewardRiskRatio = new RewardRiskRatioCriterion()
//		System.out.println("Reward-risk ratio: " + rewardRiskRatio.calculate(series, tradingRecord))
//
//		val vsBuyAndHold = new VersusBuyAndHoldCriterion(new TotalProfitCriterion())
//		System.out.println("Our profit vs buy-and-hold profit: " + vsBuyAndHold.calculate(series, tradingRecord))

		return tradingRecord
	}

}
