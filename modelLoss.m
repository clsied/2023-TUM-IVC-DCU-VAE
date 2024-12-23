function [loss,gradEncoder, gradDecoder] = modelLoss(Encoder, Decoder, X)

    % Forward
    outs = ["VAE1_Sampling/Z", "VAE1_Sampling/mu", "VAE1_Sampling/logVar",...
        "VAE2_Sampling/Z", "VAE2_Sampling/mu", "VAE2_Sampling/logVar",...
        "VAE3_Sampling/Z", "VAE3_Sampling/mu", "VAE3_Sampling/logVar"];
    
    [latent1, mu1, logVar1, latent2, mu2, logVar2, latent3, mu3, logVar3] = forward(Encoder,X,Outputs=outs);

    X_hat = forward(Decoder, latent3, latent2, latent1);
    mu = horzcat(mu1, mu2, mu3);
    logVar = horzcat(logVar1, logVar2, logVar3);

    % Calculate loss
    % Notice that X_hat is normalized
    loss = elboLoss(X_hat, X, mu, logVar);

[gradEncoder, gradDecoder] = dlgradient(loss, Encoder.Learnables, Decoder.Learnables);

end