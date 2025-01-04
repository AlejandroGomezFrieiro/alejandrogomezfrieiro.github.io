install:
        npm install

shell:
        nix develop

serve:
        npx quartz build --serve

sync:
        npx quartz sync
