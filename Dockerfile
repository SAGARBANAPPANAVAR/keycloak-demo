# Use official Keycloak image from Quay
FROM quay.io/keycloak/keycloak:26.0.7

# Enable health and metrics endpoints (optional but recommended)
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true

ENV KC_BOOTSTRAP_ADMIN_USERNAME=admin
ENV KC_BOOTSTRAP_ADMIN_PASSWORD=admin@@123
# Expose the HTTP port
EXPOSE 8080

# Start Keycloak in production (optimized) mode
# Set Keycloak to listen on 0.0.0.0 so Render can access it
ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start", "--http-enabled=true", "--http-port=8080", "--proxy-headers=xforwarded", "--http-host=0.0.0.0","--hostname=security-toppercent.onrender.com", "--hostname-strict=false"]
