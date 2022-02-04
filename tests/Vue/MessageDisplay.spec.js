import MessageDisplay from '../../resources/js/components/MessageDisplay.vue';
import { mount } from '@vue/test-utils';
import { getMessage } from '../../resources/js/services/axios.js';
import flushPromises from 'flush-promises';

jest.mock('../../resources/js/services/axios.js');

beforeEach(()=>{
    jest.clearAllMocks(); //clear out the mock before each test
})
describe('MessageDisplay', () => {
    test("Calls getMessage and displays message", async ()=>{
        let mockMessage = "Hello from the db mofo!";
        getMessage.mockResolvedValueOnce({ "text": mockMessage }); //mock the API
        let wrapper = mount(MessageDisplay);
        await flushPromises(); //wait for the promise to resolve
        expect(getMessage).toHaveBeenCalledTimes(1); //check the call happened once
        let message = wrapper.find('[data-testid="message"]').text(); //check the component displays message
        expect(message).toEqual(mockMessage);
    });

    test("Displays error message when request fails", async ()=>{
        let mockError = 'Oops! Something went wrong.';
        getMessage.mockRejectedValueOnce(); //mock the API
        const wrapper = mount(MessageDisplay);
        await flushPromises(); //wait for the promise to resolve
        expect(getMessage).toHaveBeenCalledTimes(1); //check the call happened once
        let message = wrapper.find('[data-testid="message-error"]').text(); //check the component displays error message
        expect(message).toEqual(mockError);
    })
})