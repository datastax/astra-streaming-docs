package com.datastax.pulsar;

import java.util.concurrent.TimeUnit;

import org.apache.pulsar.client.api.AuthenticationFactory;
import org.apache.pulsar.client.api.Consumer;
import org.apache.pulsar.client.api.Message;
import org.apache.pulsar.client.api.PulsarClient;
import org.apache.pulsar.client.api.PulsarClientException;
import org.apache.pulsar.client.api.Schema;
import org.apache.pulsar.client.api.SubscriptionInitialPosition;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class SimplePulsarConsumer {

    private static final Logger LOG = LoggerFactory.getLogger(SimplePulsarConsumer.class);

    public static void main(String[] args) {

        PulsarClient pulsarClient = null;
        Consumer<DemoBean> pulsarConsumer = null;

        try {
            Configuration conf = Configuration.getInstance();

            // Create client object
            pulsarClient = PulsarClient.builder()
                    .serviceUrl(conf.getServiceUrl())
                    .authentication(AuthenticationFactory.token(conf.getAuthenticationToken()))
                    .build();

            pulsarConsumer = pulsarClient.newConsumer(Schema.JSON(DemoBean.class))
                    .topic("persistent://"
                            + conf.getTenantName() + "/"
                            + conf.getNamespace() + "/"
                            + conf.getTopicName())
                    .startMessageIdInclusive()
                    .subscriptionInitialPosition(SubscriptionInitialPosition.Earliest)
                    .subscriptionName("SimplePulsarConsumer")
                    {subscription-comment}
                    {subscription-type}
                    .subscribe();

            while (true) {
                Message<DemoBean> msg = pulsarConsumer.receive(conf.getWaitPeriod(), TimeUnit.MILLISECONDS);
                if (msg != null) {
                    LOG.info("Message received: {}", new String(msg.getData()));
                    pulsarConsumer.acknowledge(msg);
                    Thread.sleep(conf.getWaitPeriod());
                }
            }

        } catch (PulsarClientException e) {
            throw new IllegalStateException("Cannot connect to pulsar", e);
        } catch (InterruptedException e) {
            LOG.info("Stopped request retrieved");
        } finally {
            try {
                if (null != pulsarConsumer) pulsarConsumer.close();
                if (null != pulsarClient) pulsarClient.close();
            } catch (PulsarClientException pce) {
                LOG.error("Got Pulsar Client Exception", pce);
            }
            LOG.info("SimplePulsarProducer has been stopped.");
        }
    }

}