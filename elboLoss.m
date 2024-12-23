function loss = elboLoss(X_hat,X,mu,logVar)

    % Distortion loss.
    % mse_loss = mean((X_hat - X).^2, 'all');
    mse_loss = mse(X_hat,  X) / numel(X);

    % KL loss.
    kl_loss = -0.5 * (1 + logVar - mu.^2 - exp(logVar));
    kl_loss = mean(kl_loss, 'all');
    
    % Combined loss.
    % loss = mse_loss +  0.0001 * kl_loss;
    loss = mse_loss +  0.0001 * kl_loss;
    % loss = mse_loss;

end