---
title: Therapeutic Refactoring, food for thought, hard to digest
date: 2012-10-14 09:46 +02:00
tags:
---

One morning, when Gregor Samsa woke from troubled dreams, he found himself transformed in his bed into a horrible vermin.

Inline also works the same `def test_method; echo "string"; end`. As you can see.

He lay on his armour-like back, and if he lifted his head a little he could see his brown belly, slightly domed and divided by arches into stiff sections. The bedding was hardly able to cover it and seemed ready to slide off any moment.

    :::ruby
    module SimultaneousBatches
      extend ActiveSupport::Concern

      included do
        helper_method :can_start_new_batch?
        private :can_start_new_batch?
      end

      def can_start_new_batch?
        !Batch.has_any_running?
      end
    end


His many legs, pitifully thin compared with the size of the rest of him, waved about helplessly as he looked. One morning, when Gregor Samsa woke from troubled dreams, he found himself transformed in his bed into a horrible vermin. He lay on his armour-like back, and if he lifted his head a little he could see his brown belly, slightly domed and divided by arches into stiff sections. The bedding was hardly able to cover it and seemed ready to slide off any moment.

His many legs, pitifully thin compared with the size of the rest of him, waved about helplessly as he looked.
