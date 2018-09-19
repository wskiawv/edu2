Ext.define('desktop.app.comm.DateTimeField', {
      extend: 'Ext.form.field.Date',
      alias: 'widget.datetimefield',
      requires: ['desktop.app.comm.DateTimePicker'],
      initComponent: function() {
          this.format = this.format;
          this.callParent();
      },
      // overwrite
      createPicker: function() {
          var me = this,
              format = Ext.String.format;
          return Ext.create('desktop.app.comm.DateTimePicker', {
                ownerCt: me.ownerCt,
                renderTo: document.body,
                width:260,
                floating: true,
                hidden: true,
                focusOnShow: true,
                minDate: me.minValue,
                maxDate: me.maxValue,
                disabledDatesRE: me.disabledDatesRE,
                disabledDatesText: me.disabledDatesText,
                disabledDays: me.disabledDays,
                disabledDaysText: me.disabledDaysText,
                format: me.format,
                showToday: me.showToday,
                startDay: me.startDay,
                minText: format(me.minText, me.formatDate(me.minValue)),
                maxText: format(me.maxText, me.formatDate(me.maxValue)),
                listeners: {
                    scope: me,
                    select: me.onSelect
                },
                keyNavConfig: {
                    esc: function() {
                        me.collapse();
                    }
                }
            });
      }
  });