({
    render : function(cmp) {
        cmp.set('v.stage', cmp.get('v.stage')+1);
        return this.superRender();
    },

    afterRender : function(cmp) {
        cmp.set('v.stage', cmp.get('v.stage')+2);
        return this.superAfterRender();
    },

    rerender : function(cmp) {
        cmp.set('v.stage', cmp.get('v.stage')+3);
        return this.superRerender();
    },

})